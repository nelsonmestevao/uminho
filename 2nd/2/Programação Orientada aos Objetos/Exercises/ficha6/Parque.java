package ficha6;

import java.util.Set;
import java.util.Map;
import java.util.HashMap;

public class Parque {
    public Map<String, Lugar> getLugares() {
        Map<String, Lugar> res = new HashMap<>();
        Set<String> matriculas = lugares.keySet();
        for (String matricula : matriculas) {
            Lugar l = lugares.get(matricula);
            res.put(matricula, l.clone());
        }
        return res;
    }
}
