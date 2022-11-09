import csv
import numpy
import os
import re
import sys
import scipy.stats

def main():	
	fileName = selectFile(r'Algorithm_benchmark_[0-9]+\.csv', False)
	file = open(fileName, 'r')
	reader = csv.reader(file)
	header = next(reader)

	initData = {}
	keyGenData = {}
	signData = {}
	verifyData = {}

	for row in reader:
		algorithm = row[0]
		pubkeyLen = int(row[1])
		privkeyLen = int(row[2])
		sigLen = int(row[3])
		pubPlusSig = int(row[4])
		numSamples = int(row[5])
		initMs = float(row[7])
		keygenMs = float(row[8])
		signMs = float(row[9])
		verifyMs = float(row[10])

		if algorithm not in initData:
			initData[algorithm] = []
			keyGenData[algorithm] = []
			signData[algorithm] = []
			verifyData[algorithm] = []

		initData[algorithm].append(initMs)
		keyGenData[algorithm].append(keygenMs)
		signData[algorithm].append(signMs)
		verifyData[algorithm].append(verifyMs)


	outputFileName = fileName[:-4] + '_processed.csv'
	outputFile = open(outputFileName, 'w')
	header = ''
	header += 'Algorithm,'
	header += 'Key generation milliseconds,'
	header += '± CI,'
	header += 'Signing milliseconds,'
	header += '± CI,'
	header += 'Verifying milliseconds,'
	header += '± CI,'
	outputFile.write(header + '\n')

	for algorithm in initData:
		print(f'Processing {algorithm}...')
		line = ''
		line += algorithm + ','
		#mean, ci = mean_confidence_interval(initData[algorithm])
		mean, ci = mean_confidence_interval(keyGenData[algorithm])
		line += str(mean) + ','
		line += str(ci) + ','
		mean, ci = mean_confidence_interval(signData[algorithm])
		line += str(mean) + ','
		line += str(ci) + ','
		mean, ci = mean_confidence_interval(verifyData[algorithm])
		line += str(mean) + ','
		line += str(ci) + ','
		outputFile.write(line + '\n')

	print(f'Successfully saved to {outputFileName}!')

def mean_confidence_interval(data, confidence = 0.95):
	a = 1.0 * numpy.array(data)
	n = len(a)
	m, se = numpy.mean(a), scipy.stats.sem(a)
	h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
	return m, h

# Given a regular expression, list the files that match it, and ask for user input
def selectFile(regex, subdirs = False):
	files = []
	if subdirs:
		for (dirpath, dirnames, filenames) in os.walk('.'):
			for file in filenames:
				path = os.path.join(dirpath, file)
				if path[:2] == '.\\': path = path[2:]
				if bool(re.match(regex, path)):
					files.append(path)
	else:
		for file in os.listdir(os.curdir):
			if os.path.isfile(file) and bool(re.match(regex, file)):
				files.append(file)
	
	print()
	if len(files) == 0:
		print(f'No files were found that match "{regex}"')
		print()
		return ''

	print('List of files:')
	for i, file in enumerate(files):
		print(f'  File {i + 1}  -  {file}')
	print()

	selection = None
	while selection is None:
		try:
			i = int(input(f'Please select a file (1 to {len(files)}): '))
		except KeyboardInterrupt:
			sys.exit()
		except:
			pass
		if i > 0 and i <= len(files):
			selection = files[i - 1]
	print()
	return selection


if __name__ == "__main__":
	main()
