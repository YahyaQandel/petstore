def read_input_file(file):
    file = open(file, "r")
    if file.mode == 'r':
        return file.read()


def get_items_count(contents):
    return int(contents.split('\n')[0].split(' ')[1])


def get_bidders_count(contents):
    return len(contents.split('\n')) - 1


def get_bidders(contents):
    return contents.split('\n')[1:]


def get_what_bidders_should_pay(file):
    output = ""
    contents = read_input_file(file)
    bidders = get_bidders(contents)
    bidders_sorted_desc = sort_bidder_by_descending(bidders)
    bidders_sorted_desc.sort(key=lambda x: x[1], reverse=True)
    winners_list = sort_bidders_by_second_price_auction(bidders_sorted_desc)
    iterator = 0
    for winner in winners_list:
        output += "{} {}".format(winner[0], winner[1])
        if (iterator + 1) < len(winners_list):
            output += "\n"
        iterator += 1
    return output


def sort_bidder_by_descending(bidders):
    bidders_sorted_desc = []
    for bidder in bidders:
        bidder_list_item = []
        bidder_list_item.append(get_bidder_name(bidder))
        bidder_list_item.append(get_bidder_amount(bidder))
        bidders_sorted_desc.append(bidder_list_item)
    return bidders_sorted_desc


def sort_bidders_by_second_price_auction(bidders_sorted_desc):
    i = 0
    bidders_sorted_list = []
    for bidder in bidders_sorted_desc:
        list_item = []
        if (i + 1) < len(bidders_sorted_desc):
            list_item.append(bidder[0])
            list_item.append(bidders_sorted_desc[i + 1][1])
        else:
            list_item.append(bidders_sorted_desc[-1][0])
            list_item.append('Lost')
        bidders_sorted_list.append(list_item)
        i += 1
    return bidders_sorted_list


def get_bidder_name(bidder):
    bidder_string = bidder.split(' ')
    return "{} {}".format(bidder_string[0], bidder_string[1])


def get_bidder_amount(bidder):
    bidder_string = bidder.split(' ')
    return int(bidder_string[2])


get_what_bidders_should_pay("auction/input.txt")
