using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

class Bob
{
    public static string Hey(string phrase)
    {
        phrase = phrase.Trim();
        if (phrase.Length == 0)
        {
            return "Fine. Be that way!";
        }
        else if (phrase == phrase.ToUpper() && Regex.IsMatch(phrase, @"[A-Z]"))
        {
            return "Whoa, chill out!";
        }
        else if (phrase.Last() == '?')
        {
            return "Sure.";
        }
        return "Whatever.";
    }
}

