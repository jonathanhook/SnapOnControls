package com.example.visualiser;
import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NdefMessage;
import android.nfc.NfcManager;
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
import java.util.Timer;
import java.util.TimerTask;

@TargetApi(Build.VERSION_CODES.KITKAT)
public class MainActivity extends ActionBarActivity implements WirelessControlsInterface.WirelessControlsEventListener
{
    private WirelessControlsInterface wirelessInterface;

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

        wirelessInterface = new WirelessControlsInterface(this, true, 32);
        wirelessInterface.addWirelessControlsEventListener(this);
    }

    @Override
    public void onResume()
    {
        super.onResume();

        Intent intent = getIntent();
        String action = intent.getAction();
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

    public void onDataReceived(WirelessControlsInterface sender)
    {
        boolean[] digital = sender.getDigitalControls();

        updateTextById(R.id.d0, digital[0] ? "True" : "False");
        updateTextById(R.id.d1, digital[1] ? "True" : "False");
        updateTextById(R.id.d2, digital[2] ? "True" : "False");
        updateTextById(R.id.d3, digital[3] ? "True" : "False");
    }

    public void onTagAdded(WirelessControlsInterface sender)
    {
        NfcV tag = sender.getNfcVTag();
        byte[] id = tag.getTag().getId();

        updateTextById(R.id.tagConnectedTextView, "True");
        updateTextById(R.id.tagId, id.toString());
    }

    public void onTagRemoved(WirelessControlsInterface sender)
    {
        updateTextById(R.id.tagConnectedTextView, "False");
        updateTextById(R.id.tagId, "NULL");

        updateTextById(R.id.d0, "False");
        updateTextById(R.id.d1, "False");
        updateTextById(R.id.d2, "False");
        updateTextById(R.id.d3, "False");
    }

    private void updateTextById(final int id, final String text)
    {
        this.runOnUiThread(new Runnable()
        {
            @Override
            public void run()
            {
                TextView t = (TextView)findViewById(id);
                t.setText(text);
            }
        });
    }
}