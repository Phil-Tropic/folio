package com.example.tp5;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    EditText txtPrenom, txtNom, txtCivique, txtRue, txtApp, txtVille, txtCodePostal, txtTelephone, txtTelephone1, txtCell, txtDate, txtCarteMaladie, txtExpiration,
            txtContactUrgence, txtTelephone2, txtRaisonVisite, txtTuter;

    CheckBox checkBoxF, checkBoxM, checkBoxParent, checkBoxTuteur, checkBoxMadame, checkBoxMonsieur;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void goToFormulaire(View view) {
        setContentView(R.layout.formulaire);
    }

    public void goToFormulaire2(View view) {
        setContentView(R.layout.formulaire);

        txtPrenom = findViewById(R.id.txtPrenom);
        String txtPrenom = this.txtPrenom.getText().toString();

        txtNom = findViewById(R.id.txtNom);
        String txtNom = this.txtNom.getText().toString();

        txtCivique = findViewById(R.id.txtCivique);
        String txtCivique = this.txtCivique.getText().toString();

        txtRue = findViewById(R.id.txtRue);
        String txtRue= this.txtRue.getText().toString();

        txtApp = findViewById(R.id.txtApp);
        String txtApp = this.txtApp.getText().toString();

        txtVille = findViewById(R.id.txtVille);
        String txtVille = this.txtVille.getText().toString();

        txtCodePostal = findViewById(R.id.txtCodePostal);
        String txtCodePostal = this.txtCodePostal.getText().toString();

        txtTelephone = findViewById(R.id.txtTelephone);
        String txtTelephone = this.txtTelephone.getText().toString();

        txtTelephone1 = findViewById(R.id.txtTelephone1);
        String txtTelephone1 = this.txtTelephone1.getText().toString();

        txtCell = findViewById(R.id.txtCell);
        String txtCell = this.txtCell.getText().toString();

        txtDate = findViewById(R.id.txtDate);
        String txtDate = this.txtDate.getText().toString();

        txtCarteMaladie = findViewById(R.id.txtCarteMaladie);
        String txtCarteMaladie = this.txtCarteMaladie.getText().toString();

        txtExpiration = findViewById(R.id.txtExpiration);
        String txtExpiration = this.txtExpiration.getText().toString();

        txtContactUrgence = findViewById(R.id.txtContactUrgence);
        String txtContactUrgence = this.txtContactUrgence.getText().toString();

        txtTelephone2 = findViewById(R.id.txtTelephone2);
        String txtTelephone2 = this.txtTelephone2.getText().toString();

        txtRaisonVisite = findViewById(R.id.txtRaisonVisite);
        String txtRaisonVisite = this.txtRaisonVisite.getText().toString();

        txtTuter = findViewById(R.id.txtTuter);
        String txtTuter = this.txtTuter.getText().toString();

        dbFormulaire dbf = new dbFormulaire(this);
        dbf.execute(txtPrenom,txtNom,txtCivique,txtRue,txtApp,txtVille,txtCodePostal,txtTelephone,txtTelephone1,
                txtCell,txtDate,txtCarteMaladie,txtExpiration,txtContactUrgence,txtTelephone2,txtRaisonVisite,txtTuter);


        checkBoxF = findViewById(R.id.checkBoxF);
        checkBoxM = findViewById(R.id.checkBoxM);
        checkBoxParent = findViewById(R.id.checkBoxParent);
        checkBoxTuteur = findViewById(R.id.checkBoxTuteur);
        checkBoxMadame = findViewById(R.id.checkBoxMadame);
        checkBoxMonsieur = findViewById(R.id.checkBoxMonsieur);




    }

    public void goToInscription(View view) {
    }
}