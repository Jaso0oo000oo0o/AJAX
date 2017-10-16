import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dllo on 17/9/27.
 */
public class Analysis {
    @Test
    public List<China> ana() {

        List<China> list = new ArrayList<>();

        File file = new File("/Users/dllo/Desktop/china.xml");
        SAXReader reader = new SAXReader();

        try {
            Document document = reader.read(file);

            Element root = document.getRootElement();

            List<Element> elements = root.elements();

            for (Element element : elements) {
                China china = new China();
                china.setProvince(element.attributeValue("name"));
                List<Element> subElms = element.elements();
                List<String> city = new ArrayList<>();
                for (Element elm : subElms) {
                    city.add(elm.getTextTrim());
                }
                china.setCity(city);
                list.add(china);
            }

            return list;

        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return null;
    }
}
