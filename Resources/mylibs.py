import csv

def append_list_to_file(path, list):
	with open(path, "a") as file_handler:
		# The first item is " ", so for loop starts from second item.
		for item in list[1:]:
			file_handler.write("{}\t|\t".format(item))
		file_handler.write("\n")

def append_list_to_csv(path, list):
	list.pop(0)
	with open(path, 'a') as fp:
		wr = csv.writer(fp, dialect='excel')
		wr.writerow(list)

def append_header_to_csv(path):
	header = ["Time", "Command", "Status Details", "Device EID", "CID", "Data Object"]
	with open(path, 'a') as fp:
		wr = csv.writer(fp, dialect='excel')
		wr.writerow(header)
