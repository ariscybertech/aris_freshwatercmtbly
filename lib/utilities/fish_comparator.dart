class FishComparator {
  FishComparator(this.compData, this.numFish);

  int numFish;
  var compData = <dynamic>[];
  var detailedResults = <String>[];

  List<String> compareFish(
    List<String> addedFish,
  ) {
    List<String> comparisonResults = <String>[];
    detailedResults = [];

    if (addedFish.length < 2) {
      print("Returning, at least two fish must be selected.");
      return comparisonResults;
    }

    for (int i = 0; i < addedFish.length; i++) {
      for (int j = 0; j < numFish; j++) {
        if (addedFish[i] == compData[j]['Comparison_Fish']) {
          for (int k = i + 1; k < addedFish.length; k++) {
            print("addedFish[i]:" +
                addedFish[i] +
                "Comparison_Fish match: " +
                addedFish[k]);

            switch (addedFish[k]) {
              case "Angelfish":
                comparisonResults.add(compData[j]['Angelfish']);
                break;
              case "Barbs":
                comparisonResults.add(compData[j]['Barbs']);
                break;
              case "Bettas":
                comparisonResults.add(compData[j]['Bettas']);
                break;
              case "Cichlids_African":
                comparisonResults.add(compData[j]['Cichlids_African']);
                break;
              case "Cichlids_South_American":
                comparisonResults.add(compData[j]['Cichlids_South_American']);
                break;
              case "Cory_Cats":
                comparisonResults.add(compData[j]['Cory_Cats']);
                break;
              case "Danios_Minnows":
                comparisonResults.add(compData[j]['Danios_Minnows']);
                break;
              case "Discus":
                comparisonResults.add(compData[j]['Discus']);
                break;
              case "Eels":
                comparisonResults.add(compData[j]['Eels']);
                break;
              case "Goldfish":
                comparisonResults.add(compData[j]['Goldfish']);
                break;
              case "Gouramis":
                comparisonResults.add(compData[j]['Gouramis']);
                break;
              case "Guppies":
                comparisonResults.add(compData[j]['Guppies']);
                break;
              case "Hatchets":
                comparisonResults.add(compData[j]['Hatchets']);
                break;
              case "Killifish":
                comparisonResults.add(compData[j]['Killifish']);
                break;
              case "Koi":
                comparisonResults.add(compData[j]['Koi']);
                break;
              case "Loaches":
                comparisonResults.add(compData[j]['Loaches']);
                break;
              case "Mollies":
                comparisonResults.add(compData[j]['Mollies']);
                break;
              case "Oscars":
                comparisonResults.add(compData[j]['Oscars']);
                break;
              case "Platies":
                comparisonResults.add(compData[j]['Platies']);
                break;
              case "Plecos":
                comparisonResults.add(compData[j]['Plecos']);
                break;
              case "Rainbow_Fish":
                comparisonResults.add(compData[j]['Rainbow_Fish']);
                break;
              case "Rasboras":
                comparisonResults.add(compData[j]['Rasboras']);
                break;
              case "Sharks":
                comparisonResults.add(compData[j]['Sharks']);
                break;
              case "Swordtails":
                comparisonResults.add(compData[j]['Swordtails']);
                break;
              case "Tetras":
                comparisonResults.add(compData[j]['Tetras']);
                break;
              case "Invertebrates":
                comparisonResults.add(compData[j]['Invertebrates']);
                break;
              case "Plants":
                comparisonResults.add(compData[j]['Plants']);
                break;
              default:
                comparisonResults.add("none");
                break;
            }

            if (comparisonResults[comparisonResults.length - 1] == 'warn') {
              String resultString =
                  'Warning when mixing ${addedFish[i]} & ${addedFish[k]}';

              if (!detailedResults.contains(resultString)) {
                detailedResults.add(resultString);
              }
            } else if (comparisonResults[comparisonResults.length - 1] ==
                'no') {
              String resultString =
                  '${addedFish[i]} & ${addedFish[k]} are not compatible.';

              if (!detailedResults.contains(resultString)) {
                detailedResults.add(resultString);
              }
            }
          }
        }
      }
    }

    print("Full results: ");
    print(comparisonResults);

    return comparisonResults;
  }
}
