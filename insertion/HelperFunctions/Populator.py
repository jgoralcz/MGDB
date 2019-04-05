import string
import random


class Populator:
    def __init__(self):
        """
        initiates new object
        """
    @staticmethod
    def random_string(size=16, chars=string.ascii_letters + string.digits + ' '):
        """
        creates a random string between the specified size and ascii letters and digits.
        Also includes spaces.
        :param size: thee size to have up to
        :type: int
        :param chars: the list of chars to include (default is uppercase ascii and string digits)
        :type: str
        :return: random str
        :rtype: str
        """
        # generate a new size randomly up to their size, at least 1 character.
        size = random.randint(1, size)
        return ''.join(random.choice(chars) for _ in range(size))

    @staticmethod
    def random_date(digits_year=string.digits, digits_month="012", digits_day="012"):
        """
        generates a random internal date: YYYY-MM-DD format.
        :param digits_year: the digits to use for the year.
        :type: str
        :param digits_month: the digits to use for the month. Default is 0-9. Default is '012' to be safe with sql dates.
        :type: str
        :param digits_day: the digits to use for the day. Default is 0-9. Default is '012' to be safe with sql dates.
        :type: str
        :return: random str with YYYY-MM-DD format.
        :rtype: str
        """

        year = int(Populator._random_digit(4, digits_year))
        if year <= 1001:
            year = 1002

        return year + "-" + Populator._random_digit(2, digits_month) + "-" + Populator._random_digit(2, digits_day)

    @staticmethod
    def _random_digit(size=2, digits="012"):
        """
        creates a random number based off the size.
        :param size: the size to generate a number. Default is 2 for safety
        :type: int
        :param digits: the digits to use. Default is '012' to be safe with sql dates.
        :type: str
        :return:
        """
        return ''.join(random.choice(digits) for _ in range(size))
