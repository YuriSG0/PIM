# PIM
package com.example.powertraining;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button login = findViewById(R.id.login);
        Button cadastro = findViewById(R.id.cadastro);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                IrParaTelaLogin();
            }
        });

        cadastro.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                IrParaCadastro();
            }
        });
    }

    private void IrParaTelaLogin() {
        Intent telaLogin = new Intent(this, TelaLogin.class);
        startActivity(telaLogin);
    }

    private void IrParaCadastro() {
        Intent telaCadastro = new Intent(this, TelaCadastro.class);
        startActivity(telaCadastro);
    }
}
