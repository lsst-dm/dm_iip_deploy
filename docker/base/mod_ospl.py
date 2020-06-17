import os
import os.path
import sys
import xml.etree.ElementTree as ET
import argparse
from urllib.parse import urlparse


if __name__ == "__main__":

    name = os.path.basename(sys.argv[0])

    #parser = argparse.ArgumentParse(prog=name, 
    #                                description='''rewrite NetworkInterfacAddress value in ospl.xml file''')
    #parser.add_argument('input_file', help='original ospl.xml file')
    #parser.add_argument('output_file', help='rewritten ospl.xml file')
    #parser.add_argument('network_interface_address', help='value to replace in NetworkInterfaceAddress')


    components = urlparse(sys.argv[1])
    file_path = components.path
    
    tree = ET.parse(file_path)
    root = tree.getroot()
    
    type_tag = root.find('DDSI2Service/General/NetworkInterfaceAddress')
    type_tag.text = sys.argv[3]
    
    tree.write(sys.argv[2])
