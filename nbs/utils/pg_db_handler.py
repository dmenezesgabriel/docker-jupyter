import pandas as pd
import psycopg2
import psycopg2.extras


class DatabaseHandler:
    """
    Handler for execute queries in a given PostgreSQL database
    """

    def __init__(self, database_uri):
        """
        Class atributes
        :database_uri: postgresql://postgres:postgres@localhost:5432/postgres
        """
        self.database_uri = database_uri
        self._connection = self._connect()

    @property
    def connection(self):
        """
        Connection attribute
        """
        return self._connection

    def _connect(self):
        """
        Establish connection with the database
        """
        return psycopg2.connect(self.database_uri, connect_timeout=10)

    def _reconnect(self):
        """
        Reconnect to database, if connection is closed
        """
        if self._connection.closed > 0:
            self._connection = self._connect()

    def close(self):
        """
        Close the connection
        """
        self._connection.close()

    def cursor(self):
        """Create cursors"""
        return self.connection.cursor(
            cursor_factory=psycopg2.extras.RealDictCursor
        )

    def db_connector(func):
        """
        Check the connection before making query,
        connect if disconnected
        :func: Database related function which uses
        :return:DatabaseHandler connection
        """

        def with_connection(self, *args, **kwargs):
            self._reconnect()
            try:
                result = func(self, *args, **kwargs)
            except Exception as error:
                print(f"Error: {error}")

            return result

        return with_connection

    @db_connector
    def fetch(self, query, params=None, max_tries=5):
        """
        Fetch query results
        :query: Database related function which uses
        DatabaseHandler connection
        :params: Query params
        :max_tries: Max number of query retries
        :return: Query results as a list of dicts
        """
        attempt_no = 0
        while attempt_no < max_tries:
            attempt_no += 1
            cursor = self.cursor()
            try:
                with self.connection:
                    with cursor:
                        cursor.execute(query, params)
                        return cursor.fetchall()
            except Exception as error:
                print(f"ERROR: In psycopg.cursor.fetchall(): {error}")
        return []

    @db_connector
    def query_to_df(self, sql, params=None, max_tries=5):
        """
        Create a pandas DataFrame object from a query result
        :sql: query statements
        :params: a list or a tuple of parameters that will
        be passed to the query execution
        :max_tries: number of query retries in the case of failure
        :return: Pandas DataFrame object
        """
        attempt_no = 0
        while attempt_no < max_tries:
            cursor = self.cursor()
            attempt_no += 1
            try:
                with self.connection:
                    with cursor:
                        return pd.read_sql_query(sql, self, params=params)
            except Exception as error:
                print(f"Query to DataFrame error: {error}.")


def load_query(path) -> str:
    """
    Load query from .sql file
    :query: file.sql path
    :return: String content of query file
    """
    with open(path, "r") as query_file:
        return query_file.read()
