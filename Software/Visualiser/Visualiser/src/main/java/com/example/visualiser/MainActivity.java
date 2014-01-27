package com.example.visualiser;
import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NdefMessage;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.nfc.tech.NfcV;
import android.os.Parcelable;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.ActionBar;
import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.os.Build;
import android.nfc.NfcAdapter;
import android.widget.TextView;
import android.widget.Toast;

import java.io.Console;
import java.io.IOException;

public class MainActivity extends ActionBarActivity
{
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (savedInstanceState == null)
        {
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.container, new PlaceholderFragment())
                    .commit();
        }
    }


    @Override
    public void onResume()
    {
        super.onResume();

        Intent intent = getIntent();
        String action = intent.getAction();

        if (NfcAdapter.ACTION_TECH_DISCOVERED.equals(action))
        {
            Tag tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);
            readTag(tag);
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        switch (item.getItemId())
        {
            case R.id.action_settings:
                return true;
        }

        return super.onOptionsItemSelected(item);
    }

    /**
     * A placeholder fragment containing a simple view.
     */
    public static class PlaceholderFragment extends Fragment
    {
        public PlaceholderFragment()
        {
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            View rootView = inflater.inflate(R.layout.fragment_main, container, false);
            return rootView;
        }
    }

    @TargetApi(Build.VERSION_CODES.KITKAT)
    private void readTag(Tag tag)
    {
        NfcV v = NfcV.get(tag);

        try
        {
            v.connect();

            for(int i = 0; i < 1000; i++)
            {
                byte[] singleBlock = new byte[]{0x02, 0x20, 0x3};
                byte[] multipleBlocks = new byte[] {0x02, 0x23, 0x0, 0x5};

                byte[] response = v.transceive(multipleBlocks);
                print(response);
            }

            v.close();
        }
        catch(IOException e)
        {
            TextView textView = (TextView) findViewById(R.id.textView);
            textView.setText(e.getMessage());
        }

    }

    private void print(byte[] array)
    {
        String val = "";
        for(int i = 0; i < array.length; i++)
        {
            val += "Value: ";
            val += Integer.toHexString(array[i]);
            val += "\r\n";
        }

        TextView textView = (TextView) findViewById(R.id.textView);
        textView.setText(val);
    }
}



//TextView textView = (TextView) findViewById(R.id.textView);
//textView.setText("here");