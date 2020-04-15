package ru.dayneko;

import com.mongodb.Mongo;
import org.mongeez.Mongeez;
import org.springframework.core.io.ClassPathResource;

// TODO Надо проверсти обучение по монго и его настройке
public class MongodbInit {
    private static final String host = "localhost";
    private static final int port = 27017;
    private static final String database = "orders";

    public static void main(String[] args) {
        Mongeez mongeez = new Mongeez();
        mongeez.setFile(new ClassPathResource("classpath:mongeeze/mongeeze-changelog-master.xml"));
        mongeez.setMongo(new Mongo(host, port));
        mongeez.setDbName(database);
        mongeez.process();
    }
}
