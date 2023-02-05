## Acronym
In this exercise we need extract the first character of a string. One of the most straightforward ways to accomplish this is by using the String#first method. However, I discovered that this method is only available in the Active Support library, which is not always included in projects or platforms.

For example, in the Exercism platform, the String#first method is not available. This prompted me to search for other methods to return the first character of a string. I looked into passing arguments to the (&:slice) or (&:[]) methods, but found that these methods required a more complex implementation.

One option was to use a lambda function, like this:

FIRST_CHAR = ->(word) { word[0] }
def self.abbreviate(string)
  words(string).map(&FIRST_CHAR).join.upcase
end

This code uses a lambda function, which is assigned to the FIRST_CHAR constant. The lambda function takes a word as an argument and returns the first character of that word using the array index notation. The abbreviate method uses the map method to apply the FIRST_CHAR function to each word in the string, and then uses the join method to concatenate the first characters of each word, and the upcase method to convert the result to uppercase.

However, I eventually found a more efficient solution using the String#chr method, like this:

def abbreviate(phrase)
  phrase.chr.upcase
end

This code uses the String#chr method to return the first character of a string, and the upcase method to convert the result to uppercase.

Alternatively, I found a more intelligent and concise solution using the String#scan and join methods, like this:

def abbreviate(phrase)
  phrase.scan(/\b\w/).join.upcase
end

This code uses the scan method to scan the string for word characters, then the join method to join them together in a single string, and the upcase method to convert the result to uppercase.

In conclusion, there are multiple ways to return the first character of a string in Ruby, and each approach has its own set of advantages and disadvantages. It's important to consider your specific requirements and constraints when choosing a method for your project. In my case, I found that using the String#chr method was the most efficient solution, but I regret not discovering it earlier in my search.
