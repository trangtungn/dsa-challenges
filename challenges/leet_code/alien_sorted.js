/**
 * @param {string[]} words
 * @param {string} order
 * @return {boolean}
 */
var isAlienSorted = function(words, order) {
  for(let i = 1; i < words.length; i++) {
      let prev = words[i -1];

      for (k = 0; k < prev.length + 1; k++) {
          if (order.indexOf(prev[k]) == order.indexOf(words[i][k])) {
              continue;
          }

          if (words[i][k] === undefined) {
              return false;
          }

          if (order.indexOf(prev[k]) < order.indexOf(words[i][k])) {
              break;
          } else {
              return false;
          }
      }
  }

  return true;
};


/**
 * @param {string[]} words
 * @param {string} order
 * @return {boolean}
 */
var isAlienSorted2 = function(words, order) {

  for (let i = 1; i < words.length; i++) {
      for (let j = 0; j < words[i - 1].length; j++){
          if (order.indexOf(words[i][j]) < order.indexOf(words[i - 1][j])) return false
          else if (order.indexOf(words[i][j]) > order.indexOf(words[i - 1][j])) break
      }
  }
  return true
};
