package liquibase.util;

import java.util.Comparator;
import java.util.TimeZone;

public class RawOffsetComparator implements Comparator<TimeZone> {

    @Override
    public int compare(TimeZone one, TimeZone two) {
        long offset1 = one.getRawOffset();
        long offset2 = two.getRawOffset();
        return (offset1 < offset2) ? -1 : ((offset1 == offset2) ? 0 : 1);
    }

}
