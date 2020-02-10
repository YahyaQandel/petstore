from unittest import TestCase
from auction.script import get_what_bidders_should_pay, read_input_file
from unittest import skip


class TestScript(TestCase):

    def testHappyCaseBiddersPaidAmounts(self):
        self.assertEquals(get_what_bidders_should_pay("auction/case1/input.txt"),
                          read_input_file("auction/case1/expected-output.txt"))

    def testMultipleBidders(self):
        self.assertEquals(get_what_bidders_should_pay("auction/case1/input-2.txt"),
                          read_input_file("auction/case1/expected-output-2.txt"))

    def testNoBidders(self):
        self.assertEquals(get_what_bidders_should_pay("auction/case2/input.txt"),
                          read_input_file("auction/case2/expected-output.txt"))

    def testTieBreakerOnTopOfList(self):
        self.assertEquals(get_what_bidders_should_pay("auction/case3/input.txt"),
                          read_input_file("auction/case3/expected-output.txt"))

    def testTieBreakerOnMiddleOfList(self):
        self.assertEquals(get_what_bidders_should_pay("auction/case3/input-2.txt"),
                          read_input_file("auction/case3/expected-output-2.txt"))

    @skip("put your new case here")
    def testNewCase(self):
        self.assertEquals(get_what_bidders_should_pay("auction/case4/input.txt"),
                          read_input_file("auction/case4/expected-output.txt"))
