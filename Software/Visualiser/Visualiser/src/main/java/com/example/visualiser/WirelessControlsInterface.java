package com.example.visualiser;

import android.annotation.TargetApi;
import android.nfc.Tag;
import android.nfc.tech.NfcV;
import android.os.Build;

import java.io.IOException;

@TargetApi(Build.VERSION_CODES.KITKAT)
public class WirelessControlsInterface
{
    private boolean hasTag;
    private NfcV vTag;

    public WirelessControlsInterface()
    {
        hasTag = false;
        vTag = null;
    }

    public void pollReader()
    {
        if(hasTag)
        {
            if(vTag.isConnected())
            {

            }
            else
            {
                hasTag = false;
            }
        }
    }

    public void tagDetected(Tag tag) throws IOException
    {
        vTag = NfcV.get(tag);
        vTag.connect();

        hasTag = true;
    }

    public boolean getHasTag()
    {
        return hasTag;
    }


}
