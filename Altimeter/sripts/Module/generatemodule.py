#!/usr/bin/env python
#-*- coding: utf-8 -*-
#
# Generates Module structure from template
# Version 2.0
# Homepage: https://github.com/anodamobi/XCode-Helpers
# Author: Alex Zavrazhniy <alex@anoda.mobi>
# Adapted for swift: Maksim Bazarov
# Copyright 2015, ANODA Mobile Development Agency
# License: MIT

import os
import argparse
import re
import logging
import sys

parser = argparse.ArgumentParser(description='Generates project structure from template')
parser.add_argument('--version', action='version', version='%(prog)s 1.0')
parser.add_argument('-v', dest='verbose', action='store_true', help='verbose output')
parser.add_argument('-t', '--template', dest='templatePath', type=str, help='path to template folder')
parser.add_argument('-m', '--module', dest='module', type=str, help='module name')

args = parser.parse_args()

if args.verbose:
    logging.basicConfig(level=logging.DEBUG, format='%(levelname)s: %(message)s')
else:
    logging.basicConfig(format='%(levelname)s: %(message)s')

# expand ~ in template path and make ithem absolute
if args.templatePath[0] == '~':
    args.templatePath = os.path.expanduser(args.templatePath)

args.templatePath = os.path.abspath(args.templatePath) + '/'

logging.debug('Using template folder: %s', args.templatePath)

if not os.path.isdir(args.templatePath):
    logging.error('Given templatePath is not a folder: %s', args.templatePath)
    exit(1)


args.project = 'Where my children'
args.projectLower = args.project[0].lower() + args.project[1:]
args.moduleLower = args.module[0].lower() + args.module[1:]


def replace_placeholders(input):
    output = re.sub('<%projectLower%>', args.projectLower, input)
    output = re.sub('<%project%>', args.project, output)
    output = re.sub('<%moduleLower%>', args.moduleLower, output)
    output = re.sub('<%module%>', args.module, output)
    return output


for root, dirs, files in os.walk(args.templatePath):
    logging.debug('Working in %s', root)
    folder = replace_placeholders(root).replace(args.templatePath, 'Modules/') + '/'
    if len(folder) > 1:
        print(folder)
        if not os.path.exists(folder):
            os.makedirs(folder)

    for filename in files:
        newFilename = folder + replace_placeholders(filename)
        print(newFilename)
        content = replace_placeholders(open('%s/%s' % (root, filename), encoding="latin-1").read())
        open(newFilename, 'wb').write(content.encode())

# EOF
