package com.example.powertraining;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.database.sqlite.SQLiteDatabase;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        criarBancoDados();
    }

    public void criarBancoDados() {
        try {
            SQLiteDatabase bancoDados = openOrCreateDatabase("POWER TRAINING", MODE_PRIVATE, null);

            // TABELA ALUNO
            bancoDados.execSQL("CREATE TABLE IF NOT EXISTS ALUNO(idALUNO INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "NOME VARCHAR(40) NOT NULL, " +
                    "PESO DECIMAL(2,2) NULL, " +
                    "ALTURA DECIMAL(1,2) NULL);");

            // TABELA INSTRUTOR
            bancoDados.execSQL("CREATE TABLE IF NOT EXISTS INSTRUTOR(IdINSTRUTOR INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "NOME VARCHAR(40), " +
                    "EMAIL VARCHAR(35), " +
                    "CREF VARCHAR(6));");

            // TABELA LOGINALUNO
            bancoDados.execSQL("CREATE TABLE IF NOT EXISTS LOGINALUNO(IdALUNO INTEGER, " +
                    "EMAILALUNO VARCHAR(35), " +
                    "SENHA VARCHAR(8), " +
                    "FOREIGN KEY (IdALUNO) REFERENCES ALUNO(idALUNO));");

            // TABELA LOGININSTRUTOR
            bancoDados.execSQL("CREATE TABLE IF NOT EXISTS LOGININSTRUTOR(IdINSTRUTOR INTEGER, " +
                    "EMAILINSTRUTOR VARCHAR(35), " +
                    "SENHA VARCHAR(8), " +
                    "FOREIGN KEY (IdINSTRUTOR) REFERENCES INSTRUTOR(IdINSTRUTOR));");

            // TABELA EXERCICIO
            bancoDados.execSQL("CREATE TABLE IF NOT EXISTS EXERCICIO(IDEXERCICIO INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "DESCRICAO VARCHAR(50), " +
                    "IdINSTRUTOR INTEGER, " +
                    "FOREIGN KEY (IdINSTRUTOR) REFERENCES INSTRUTOR(IdINSTRUTOR));");

            // TABELA ATIVIDADE
            bancoDados.execSQL("CREATE TABLE IF NOT EXISTS ATIVIDADE(IdATIVIDADE INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    "DESCRICAO VARCHAR(50), " +
                    "IdINSTRUTOR INTEGER, " +
                    "FOREIGN KEY (IdINSTRUTOR) REFERENCES INSTRUTOR(IdINSTRUTOR));");

            bancoDados.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

