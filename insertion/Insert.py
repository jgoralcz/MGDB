class Insert:
    """
    INSERT IGNORE into the database.
    """
    @staticmethod
    def insert(table_name, tuple_str):
        """
        the name of the table to INSERT IGNORE into.
        :param table_name: the table name.
        :type: str
        :param tuple_str: the parameters of the VALUES to enter.
        :type: str
        :return:
        """
        return "INSERT IGNORE INTO %s VALUES(%s);\n" % (table_name, tuple_str)
