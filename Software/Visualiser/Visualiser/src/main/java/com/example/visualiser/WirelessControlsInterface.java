package com.example.visualiser;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.nfc.NfcAdapter;
import android.nfc.NfcManager;
import android.nfc.Tag;
import android.nfc.tech.NfcV;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

@TargetApi(Build.VERSION_CODES.KITKAT)
public class WirelessControlsInterface implements NfcAdapter.ReaderCallback
{
    public interface WirelessControlsEventListener
    {
        public void onDataReceived(WirelessControlsInterface sender);
        public void onTagAdded(WirelessControlsInterface sender);
        public void onTagRemoved(WirelessControlsInterface sender);
    }

    private static final int NUM_DIGITAL_CONTROLS = 4;
    private static final int NUM_ANALOG_CONTROLS = 4;

    private boolean hasTag;
    private Tag tag;
    private Timer timer;
    private int readerPollRate;
    private boolean[] digitalControls;
    private byte[] analogControls;
    private List<WirelessControlsEventListener> listeners;
    private boolean autoPoll;
    private NfcV vTag;

    public WirelessControlsInterface(Activity activity, boolean autoPoll, int readerPollRate)
    {
        this.autoPoll = autoPoll;
        this.readerPollRate = readerPollRate;

        hasTag = false;
        tag = null;
        digitalControls = new boolean[NUM_DIGITAL_CONTROLS];
        analogControls = new byte[NUM_ANALOG_CONTROLS];
        listeners = new ArrayList<WirelessControlsEventListener>();

        Bundle options = new Bundle();
        //options.putInt(NfcAdapter.EXTRA_READER_PRESENCE_CHECK_DELAY, 1000);

        NfcAdapter adapter = NfcAdapter.getDefaultAdapter(activity);
        adapter.enableReaderMode(activity, this, NfcAdapter.FLAG_READER_NFC_V | NfcAdapter.FLAG_READER_SKIP_NDEF_CHECK, options);
    }

    @Override
    public void onTagDiscovered(Tag tag)
    {
        this.tag = tag;
        vTag = NfcV.get(tag);
        hasTag = true;

        if(autoPoll)
        {
            timer = new Timer();
            timer.scheduleAtFixedRate(new TimerTask()
            {
                @Override
                public void run()
                {
                    pollReader();
                }
            }, 0, readerPollRate);
        }

        for (WirelessControlsEventListener w : listeners)
        {
            w.onTagAdded(this);
        }
    }

    public void addWirelessControlsEventListener(WirelessControlsEventListener listener)
    {
        listeners.add(listener);
    }

    public void pollReader()
    {
        if(hasTag)
        {
            try
            {
                if(!vTag.isConnected())
                {
                    vTag.connect();

                    byte[] multipleBlocks = new byte[] {0x02, 0x23, 0x4, 0x1};
                    byte[] response = vTag.transceive(multipleBlocks);

                    vTag.close();

    /*
                    digitalControls[0] = response[0] != 0;
                    digitalControls[1] = response[1] != 0;
                    digitalControls[2] = response[2] != 0;
                    digitalControls[3] = response[3] != 0;

                    analogControls[0] = response[4];
                    analogControls[1] = response[5];
                    analogControls[2] = response[6];
                    analogControls[3] = response[7];*/

                    for (WirelessControlsEventListener w : listeners)
                    {
                        w.onDataReceived(this);
                    }
                }
            }
            catch(IOException e)
            {

                timer.cancel();
                hasTag = false;
                tag = null;

                for (WirelessControlsEventListener w : listeners)
                {
                    w.onTagRemoved(this);
                }

            }
        }
    }

    public boolean getHasTag() { return hasTag; }
    public boolean[] getDigitalControls() { return digitalControls; }
    public byte[] getAnalogControls() { return analogControls; }
    public Tag getTag() { return tag; }
    public NfcV getNfcVTag() { return vTag; }
}
