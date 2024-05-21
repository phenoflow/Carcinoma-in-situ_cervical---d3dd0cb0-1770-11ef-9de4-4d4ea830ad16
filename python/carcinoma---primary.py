# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"107363.0","system":"readv2"},{"code":"12913.0","system":"readv2"},{"code":"5295.0","system":"readv2"},{"code":"107295.0","system":"readv2"},{"code":"107348.0","system":"readv2"},{"code":"20602.0","system":"readv2"},{"code":"107831.0","system":"readv2"},{"code":"107497.0","system":"readv2"},{"code":"3279.0","system":"readv2"},{"code":"7610.0","system":"readv2"},{"code":"4087.0","system":"readv2"},{"code":"5446.0","system":"readv2"},{"code":"72695.0","system":"readv2"},{"code":"50126.0","system":"readv2"},{"code":"63477.0","system":"readv2"},{"code":"9184.0","system":"readv2"},{"code":"22493.0","system":"readv2"},{"code":"24228.0","system":"readv2"},{"code":"1910.0","system":"readv2"},{"code":"22037.0","system":"readv2"},{"code":"107264.0","system":"readv2"},{"code":"16859.0","system":"readv2"},{"code":"21886.0","system":"readv2"},{"code":"8226.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('carcinoma-in-situ_cervical-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["carcinoma---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["carcinoma---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["carcinoma---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
