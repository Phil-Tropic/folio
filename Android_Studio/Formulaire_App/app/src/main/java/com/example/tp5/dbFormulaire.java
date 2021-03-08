package com.example.tp5;

import android.app.AlertDialog;
import android.content.Context;
import android.os.AsyncTask;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class dbFormulaire extends AsyncTask {
    private Context c;
    private AlertDialog ad;

    public dbFormulaire(Context c)
    {
        this.c = c;
    }

    @Override
    protected void onPreExecute()
    {
        this.ad = new AlertDialog.Builder(this.c).create();
        this.ad.setTitle("Login status");
    }

    @Override
    protected String doInBackground(Object[] param) {

        String cible = "http://192.168.2.11/Android_PHP/createClient.php";

        try {
            URL url = new URL(cible);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setRequestMethod("POST");

            OutputStream outs = con.getOutputStream();
            BufferedWriter bufw = new BufferedWriter(new OutputStreamWriter(outs, StandardCharsets.UTF_8));

            String msg =
                    URLEncoder.encode("titre", "utf-8") + "=" +
                    URLEncoder.encode((String) param[0], "utf8") + "&" +
                            URLEncoder.encode("description", "utf-8") + "=" +
                    URLEncoder.encode((String) param[1], "utf8") + "&" +
                            URLEncoder.encode("rating", "utf-8") + "=" +
                    URLEncoder.encode((String) param[2], "utf8") + "&" +
                            URLEncoder.encode("participation", "utf-8") + "=" +
                    URLEncoder.encode((String) param[3], "utf8") + "&" +
                            URLEncoder.encode("inscriptions", "utf-8") + "=" +
                    URLEncoder.encode((String) param[4], "utf8");

            bufw.write(msg);
            bufw.flush();
            bufw.close();
            outs.close();

            InputStream ins = con.getInputStream();
            BufferedReader bufr = new BufferedReader(new InputStreamReader(ins, StandardCharsets.ISO_8859_1));
            String line;
            StringBuilder sbuff = new StringBuilder();

            while ((line = bufr.readLine()) != null)
            {
                sbuff.append(line).append("\n");
            }

            return sbuff.toString();
        }

        catch (Exception ex)
        {
            return ex.getMessage();
        }
    }

    @Override
    protected void onPostExecute(Object o)
    {
            this.ad.setMessage((String)o);
            this.ad.show();
    }
}