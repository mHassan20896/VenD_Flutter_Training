class StringManager {
  paragraphProcessor(String paragraph) {
    List<String> lines = _lineSeparator(paragraph);
    List<Map<String, int>> frequencyOfEveryLine = lineProcessor(lines);
    List<Map<String, int>> highestFrequencyOfEachLine =
        getLineByLineHighestFrequency(frequencyOfEveryLine);
    // Map<String, int> highestFrequencyWordOverAll =
    //     highestFrequencyWordOverall(highestFrequenecyOfEachLine);
   // print("The following words have the highest word frequency per line");
    List<List<String>> formattedOutput = formatOutput(highestFrequencyOfEachLine);
    return formattedOutput;
  }

  List<String> _lineSeparator(String paragraph) => paragraph.split("\n");

  List<Map<String, int>> lineProcessor(List<String> lines) {
    List<Map<String, int>> lineByLineFrquency = <Map<String, int>>[];
    for (String line in lines) {
      List<String> words = _wordSeparator(line);
      Map<String, int> frequencyTable = _createWordFequencyTable(words);
      lineByLineFrquency.add(frequencyTable);
    }
    return lineByLineFrquency;
  }

  List<String> _wordSeparator(String line) => line.split(" ");

  _createWordFequencyTable(List<String> words) {
    Map<String, int> frequencyTable = Map<String, int>();

    for (String word in words) {
      updateFrequencyTable(frequencyTable, word);
    }
    return frequencyTable;
  }

  updateFrequencyTable(Map<String, int> frequencyTable, String word) {
    const INITIAL_FREQUENCY = 1;
    if (tableHasWord(frequencyTable, word))
      frequencyTable[word] = incrementByOne(frequencyTable[word]!);
    else
      frequencyTable[word] = INITIAL_FREQUENCY;
  }

  tableHasWord(Map<String, int> frequencyTable, String word) =>
      frequencyTable.containsKey(word);

  int incrementByOne(int n) => n + 1;

  List<Map<String, int>> getLineByLineHighestFrequency(
      List<Map<String, int>> frequencyOfEveryLine) {
    List<Map<String, int>> highestFrequenecyOfEachLine = [];
    for (Map<String, int> frequencyTable in frequencyOfEveryLine) {
      var highestFreqofALine = getHighestFreqWordList(frequencyTable);
      highestFrequenecyOfEachLine.add(highestFreqofALine);
    }
    return highestFrequenecyOfEachLine;
  }

  Map<String, int> getHighestFreqWordList(Map<String, int> frequencyTable) {
    Map<String, int> highestFrequencyTable = Map<String, int>();
    List<int> frequencies = frequencyTable.values.toList();
    frequencies.sort();
    int highestFrequency = frequencies.last;

    frequencyTable.forEach((word, frequency) {
      if (frequency == highestFrequency) {
        highestFrequencyTable[word] = frequency;
      }
    });

    return highestFrequencyTable;
  }

  formatOutput(List<Map<String, int>> highestFrequencyOfEachLine) {
    List<List<String>> formattedOutputList = [];

    for (Map<String, int> frequencyTable in highestFrequencyOfEachLine) {
      List<String> wordListPerLine = frequencyTable.keys.toList();
      formattedOutputList.add(wordListPerLine);
    }

    return formattedOutputList;
  }

  // Map<String, int> highestFrequencyWordOverall(
  //     List<Map<String, int>> highestFrequencyOfAllLines) {
  //   var highestFrequencyWords = Map<String, int>();
  //   for (Map<String, int> highestFrequenecyOfALine
  //       in highestFrequencyOfAllLines) {
  //     highestFrequencyWords.addAll(highestFrequenecyOfALine);
  //   }
  //   Map<String, int> highestFrequencyWordsInParagraph =
  //       getHighestFreqWordList(highestFrequencyWords);
  //   return highestFrequencyWordsInParagraph;
  // }
}
