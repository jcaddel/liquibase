package liquibase.diff;

import org.junit.Test;

public class DiffTest {
    @Test
    public void dummy() {
        String s = "^*KR,^*KS";
        String[] tokens1 = s.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)", -1);
        for (String token : tokens1) {
            System.out.println(token);
        }
        String[] tokens2 = s.split(",", -1);
        for (String token : tokens2) {
            System.out.println(token);
        }


    }
}
