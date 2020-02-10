from unittest import TestCase
from auction.script import get_what_bidders_should_pay, read_input_file
import filecmp


class TestScript(TestCase):

    def testHappyCaseBiddersPaidAmounts(self):
        self.assertEquals(get_what_bidders_should_pay("auction/input.txt"),
                          read_input_file("auction/expected-output.txt"))
