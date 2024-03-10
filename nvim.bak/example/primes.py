import unittest


def primes(num: int):
    """Return a list of the first n primes."""
    sieves = [True] * num
    res = []

    for i in range(2, num):
        if sieves[i]:
            res.append(i)
            for j in range(i * i, num, i):
                sieves[j] = False
    return res


class TestPrimes(unittest.TestCase):
    def test_primes(self):
        self.assertEqual(primes(10), [2, 3, 5, 7])


if __name__ == "__main__":
    unittest.main()
