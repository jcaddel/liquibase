package liquibase.util;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class provides logic for including/excluding strings based on regular expressions.
 */
public class StringFilter {

    /**
     * Set of regular expressions. A string must match one of these to be included
     */
    Set<String> includePatterns;

    /**
     * Set of regular expressions. If there is a match on any of these the string is filtered out
     */
    Set<String> excludePatterns;
    Set<Pattern> includes;
    Set<Pattern> excludes;

    public StringFilter() {
        this(null, null);
    }

    public StringFilter(Set<String> includePatterns, Set<String> excludePatterns) {
        super();
        setIncludePatterns(includePatterns);
        setExcludePatterns(excludePatterns);
    }

    public void setIncludePatterns(Set<String> includePatterns) {
        this.includePatterns = includePatterns;
        this.includes = getPatterns(includePatterns);
    }

    public void setExcludePatterns(Set<String> excludePatterns) {
        this.excludePatterns = excludePatterns;
        this.excludes = getPatterns(excludePatterns);
    }

    public Set<String> getIncludePatterns() {
        return includePatterns;
    }

    public Set<String> getExcludePatterns() {
        return excludePatterns;
    }

    /**
     * Convert a List<String> into List<Pattern>
     */
    protected Set<Pattern> getPatterns(Set<String> patterns) {
        // If Set<String> is empty return an empty Set<Pattern>
        if (isEmpty(patterns)) {
            return new HashSet<Pattern>();
        }
        Set<Pattern> regexPatterns = new HashSet<Pattern>();
        for (String pattern : patterns) {
            Pattern regexPattern = Pattern.compile(pattern);
            regexPatterns.add(regexPattern);
        }
        return regexPatterns;
    }

    /**
     * Return true if the string matches any of the patterns
     */
    protected boolean isMatch(String s, Set<Pattern> patterns) {
        // If patterns is null or zero size, there is no match
        if (isEmpty(patterns)) {
            return false;
        }
        // Loop through the patterns looking for a match
        for (Pattern pattern : patterns) {
            Matcher matcher = pattern.matcher(s);
            // We found a match, return true
            if (matcher.matches()) {
                return true;
            }
        }
        // We cycled through all of the patterns without finding a match
        return false;
    }

    /**
     * Return false if it matches an exclude pattern.<br>
     * Return true if there are no inclusion patterns.<br>
     * Return true if it matches an inclusion pattern.<br>
     * Return false otherwise.<br>
     */
    public boolean isInclude(String s) {
        if (isExclude(s)) {
            return false;
        } else {
            return isEmpty(includePatterns) || isMatch(s, includes);
        }
    }

    /**
     * Return true if the string matches one or more of the exclude patterns
     */
    public boolean isExclude(String s) {
        return isMatch(s, excludes);
    }

    /**
     * Return true if the List is null or has zero elements
     */
    protected boolean isEmpty(Collection<?> c) {
        return c == null || c.size() == 0;
    }

    public Set<Pattern> getIncludes() {
        return includes;
    }

    public Set<Pattern> getExcludes() {
        return excludes;
    }
}
