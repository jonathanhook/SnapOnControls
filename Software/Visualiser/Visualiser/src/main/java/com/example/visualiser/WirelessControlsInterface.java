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
import java.util.Timer;
import java.util.TimerTask;

@TargetApi(Build.VERSION_CODES.KITKAT)
public class WirelessControlsInterface implements NfcAdapter.ReaderCallback
{
    private static final int NUM_DIGITAL_CONTROLS = 4;
    private static final int NUM_ANALOG_CONTROLS = 4;

    private boolean hasTag;
    private NfcV vTag;
    private Timer timer;
    private int readerPollRate;
    private byte[] digitalControls;
    private byte[] analogControls;

    public WirelessControlsInterface(Activity activity, int readerPollRate)
    {
        this.readerPollRate = readerPollRate;

        hasTag = false;
        vTag = null;
        digitalControls = new byte[NUM_DIGITAL_CONTROLS];
        analogControls = new byte[NUM_ANALOG_CONTROLS];

        NfcAdapter adapter = NfcAdapter.getDefaultAdapter(activity);
        adapter.enableReaderMode(activity, this, NfcAdapter.FLAG_READER_NFC_V | NfcAdapter.FLAG_READER_SKIP_NDEF_CHECK, null);
    }

    @Override
    public void onTagDiscovered(Tag tag)
    {
        try
        {
            vTag = NfcV.get(tag);
            vTag.connect();

            timer = new Timer();
            timer.scheduleAtFixedRate(new TimerTask()
            {
                @Override
                public void run()
                {
                    pollReader();
                }
            }, 0, readerPollRate);

            hasTag = true;
        }
        catch(IOException e)
        {
            hasTag = false;
        }
    }

    private void pollReader()
    {
        if(hasTag)
        {
            if(vTag.isConnected())
            {
                try
                {
                    byte[] multipleBlocks = new byte[] {0x02, 0x23, 0x3, 0x2};
                    byte[] response = vTag.transceive(multipleBlocks);

                    digitalControls[0] = response[0];
                    digitalControls[1] = response[1];
                    digitalControls[2] = response[2];
                    digitalControls[3] = response[3];

                    analogControls[0] = response[4];
                    analogControls[1] = response[5];
                    analogControls[2] = response[6];
                    analogControls[3] = response[7];
                }
                catch(IOException e)
                {
                    hasTag = false;
                }
            }
            else
            {
                timer.cancel();
                hasTag = false;
            }
        }
    }

    public boolean getHasTag()
    {
        return hasTag;
    }
    public byte[] getDigitalControls()
    {
        return digitalControls;
    }
    public byte[] getAnalogControls()
    {
        return analogControls;
    }
}
