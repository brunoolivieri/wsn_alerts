/**
 * This class is automatically generated by mig. DO NOT EDIT THIS FILE.
 * This class implements a Java interface to the 'returnMsg'
 * message type.
 */

public class returnMsg extends net.tinyos.message.Message {

    /** The default size of this message type in bytes. */
    public static final int DEFAULT_MESSAGE_SIZE = 10;

    /** The Active Message type associated with this message. */
    public static final int AM_TYPE = 131;

    /** Create a new returnMsg of size 10. */
    public returnMsg() {
        super(DEFAULT_MESSAGE_SIZE);
        amTypeSet(AM_TYPE);
    }

    /** Create a new returnMsg of the given data_length. */
    public returnMsg(int data_length) {
        super(data_length);
        amTypeSet(AM_TYPE);
    }

    /**
     * Create a new returnMsg with the given data_length
     * and base offset.
     */
    public returnMsg(int data_length, int base_offset) {
        super(data_length, base_offset);
        amTypeSet(AM_TYPE);
    }

    /**
     * Create a new returnMsg using the given byte array
     * as backing store.
     */
    public returnMsg(byte[] data) {
        super(data);
        amTypeSet(AM_TYPE);
    }

    /**
     * Create a new returnMsg using the given byte array
     * as backing store, with the given base offset.
     */
    public returnMsg(byte[] data, int base_offset) {
        super(data, base_offset);
        amTypeSet(AM_TYPE);
    }

    /**
     * Create a new returnMsg using the given byte array
     * as backing store, with the given base offset and data length.
     */
    public returnMsg(byte[] data, int base_offset, int data_length) {
        super(data, base_offset, data_length);
        amTypeSet(AM_TYPE);
    }

    /**
     * Create a new returnMsg embedded in the given message
     * at the given base offset.
     */
    public returnMsg(net.tinyos.message.Message msg, int base_offset) {
        super(msg, base_offset, DEFAULT_MESSAGE_SIZE);
        amTypeSet(AM_TYPE);
    }

    /**
     * Create a new returnMsg embedded in the given message
     * at the given base offset and length.
     */
    public returnMsg(net.tinyos.message.Message msg, int base_offset, int data_length) {
        super(msg, base_offset, data_length);
        amTypeSet(AM_TYPE);
    }

    /**
    /* Return a String representation of this message. Includes the
     * message type name and the non-indexed field values.
     */
    public String toString() {
      String s = "Message <returnMsg> \n";
      try {
        s += "  [MsgType=0x"+Long.toHexString(get_MsgType())+"]\n";
      } catch (ArrayIndexOutOfBoundsException aioobe) { /* Skip field */ }
      try {
        s += "  [ClientID=0x"+Long.toHexString(get_ClientID())+"]\n";
      } catch (ArrayIndexOutOfBoundsException aioobe) { /* Skip field */ }
      try {
        s += "  [ServerID=0x"+Long.toHexString(get_ServerID())+"]\n";
      } catch (ArrayIndexOutOfBoundsException aioobe) { /* Skip field */ }
      try {
        s += "  [Seq=0x"+Long.toHexString(get_Seq())+"]\n";
      } catch (ArrayIndexOutOfBoundsException aioobe) { /* Skip field */ }
      try {
        s += "  [Value=0x"+Long.toHexString(get_Value())+"]\n";
      } catch (ArrayIndexOutOfBoundsException aioobe) { /* Skip field */ }
      try {
        s += "  [Status=0x"+Long.toHexString(get_Status())+"]\n";
      } catch (ArrayIndexOutOfBoundsException aioobe) { /* Skip field */ }
      return s;
    }

    // Message-type-specific access methods appear below.

    /////////////////////////////////////////////////////////
    // Accessor methods for field: MsgType
    //   Field type: short, unsigned
    //   Offset (bits): 0
    //   Size (bits): 8
    /////////////////////////////////////////////////////////

    /**
     * Return whether the field 'MsgType' is signed (false).
     */
    public static boolean isSigned_MsgType() {
        return false;
    }

    /**
     * Return whether the field 'MsgType' is an array (false).
     */
    public static boolean isArray_MsgType() {
        return false;
    }

    /**
     * Return the offset (in bytes) of the field 'MsgType'
     */
    public static int offset_MsgType() {
        return (0 / 8);
    }

    /**
     * Return the offset (in bits) of the field 'MsgType'
     */
    public static int offsetBits_MsgType() {
        return 0;
    }

    /**
     * Return the value (as a short) of the field 'MsgType'
     */
    public short get_MsgType() {
        return (short)getUIntBEElement(offsetBits_MsgType(), 8);
    }

    /**
     * Set the value of the field 'MsgType'
     */
    public void set_MsgType(short value) {
        setUIntBEElement(offsetBits_MsgType(), 8, value);
    }

    /**
     * Return the size, in bytes, of the field 'MsgType'
     */
    public static int size_MsgType() {
        return (8 / 8);
    }

    /**
     * Return the size, in bits, of the field 'MsgType'
     */
    public static int sizeBits_MsgType() {
        return 8;
    }

    /////////////////////////////////////////////////////////
    // Accessor methods for field: ClientID
    //   Field type: int, unsigned
    //   Offset (bits): 8
    //   Size (bits): 16
    /////////////////////////////////////////////////////////

    /**
     * Return whether the field 'ClientID' is signed (false).
     */
    public static boolean isSigned_ClientID() {
        return false;
    }

    /**
     * Return whether the field 'ClientID' is an array (false).
     */
    public static boolean isArray_ClientID() {
        return false;
    }

    /**
     * Return the offset (in bytes) of the field 'ClientID'
     */
    public static int offset_ClientID() {
        return (8 / 8);
    }

    /**
     * Return the offset (in bits) of the field 'ClientID'
     */
    public static int offsetBits_ClientID() {
        return 8;
    }

    /**
     * Return the value (as a int) of the field 'ClientID'
     */
    public int get_ClientID() {
        return (int)getUIntBEElement(offsetBits_ClientID(), 16);
    }

    /**
     * Set the value of the field 'ClientID'
     */
    public void set_ClientID(int value) {
        setUIntBEElement(offsetBits_ClientID(), 16, value);
    }

    /**
     * Return the size, in bytes, of the field 'ClientID'
     */
    public static int size_ClientID() {
        return (16 / 8);
    }

    /**
     * Return the size, in bits, of the field 'ClientID'
     */
    public static int sizeBits_ClientID() {
        return 16;
    }

    /////////////////////////////////////////////////////////
    // Accessor methods for field: ServerID
    //   Field type: int, unsigned
    //   Offset (bits): 24
    //   Size (bits): 16
    /////////////////////////////////////////////////////////

    /**
     * Return whether the field 'ServerID' is signed (false).
     */
    public static boolean isSigned_ServerID() {
        return false;
    }

    /**
     * Return whether the field 'ServerID' is an array (false).
     */
    public static boolean isArray_ServerID() {
        return false;
    }

    /**
     * Return the offset (in bytes) of the field 'ServerID'
     */
    public static int offset_ServerID() {
        return (24 / 8);
    }

    /**
     * Return the offset (in bits) of the field 'ServerID'
     */
    public static int offsetBits_ServerID() {
        return 24;
    }

    /**
     * Return the value (as a int) of the field 'ServerID'
     */
    public int get_ServerID() {
        return (int)getUIntBEElement(offsetBits_ServerID(), 16);
    }

    /**
     * Set the value of the field 'ServerID'
     */
    public void set_ServerID(int value) {
        setUIntBEElement(offsetBits_ServerID(), 16, value);
    }

    /**
     * Return the size, in bytes, of the field 'ServerID'
     */
    public static int size_ServerID() {
        return (16 / 8);
    }

    /**
     * Return the size, in bits, of the field 'ServerID'
     */
    public static int sizeBits_ServerID() {
        return 16;
    }

    /////////////////////////////////////////////////////////
    // Accessor methods for field: Seq
    //   Field type: int, unsigned
    //   Offset (bits): 40
    //   Size (bits): 16
    /////////////////////////////////////////////////////////

    /**
     * Return whether the field 'Seq' is signed (false).
     */
    public static boolean isSigned_Seq() {
        return false;
    }

    /**
     * Return whether the field 'Seq' is an array (false).
     */
    public static boolean isArray_Seq() {
        return false;
    }

    /**
     * Return the offset (in bytes) of the field 'Seq'
     */
    public static int offset_Seq() {
        return (40 / 8);
    }

    /**
     * Return the offset (in bits) of the field 'Seq'
     */
    public static int offsetBits_Seq() {
        return 40;
    }

    /**
     * Return the value (as a int) of the field 'Seq'
     */
    public int get_Seq() {
        return (int)getUIntBEElement(offsetBits_Seq(), 16);
    }

    /**
     * Set the value of the field 'Seq'
     */
    public void set_Seq(int value) {
        setUIntBEElement(offsetBits_Seq(), 16, value);
    }

    /**
     * Return the size, in bytes, of the field 'Seq'
     */
    public static int size_Seq() {
        return (16 / 8);
    }

    /**
     * Return the size, in bits, of the field 'Seq'
     */
    public static int sizeBits_Seq() {
        return 16;
    }

    /////////////////////////////////////////////////////////
    // Accessor methods for field: Value
    //   Field type: int, unsigned
    //   Offset (bits): 56
    //   Size (bits): 16
    /////////////////////////////////////////////////////////

    /**
     * Return whether the field 'Value' is signed (false).
     */
    public static boolean isSigned_Value() {
        return false;
    }

    /**
     * Return whether the field 'Value' is an array (false).
     */
    public static boolean isArray_Value() {
        return false;
    }

    /**
     * Return the offset (in bytes) of the field 'Value'
     */
    public static int offset_Value() {
        return (56 / 8);
    }

    /**
     * Return the offset (in bits) of the field 'Value'
     */
    public static int offsetBits_Value() {
        return 56;
    }

    /**
     * Return the value (as a int) of the field 'Value'
     */
    public int get_Value() {
        return (int)getUIntBEElement(offsetBits_Value(), 16);
    }

    /**
     * Set the value of the field 'Value'
     */
    public void set_Value(int value) {
        setUIntBEElement(offsetBits_Value(), 16, value);
    }

    /**
     * Return the size, in bytes, of the field 'Value'
     */
    public static int size_Value() {
        return (16 / 8);
    }

    /**
     * Return the size, in bits, of the field 'Value'
     */
    public static int sizeBits_Value() {
        return 16;
    }

    /////////////////////////////////////////////////////////
    // Accessor methods for field: Status
    //   Field type: short, unsigned
    //   Offset (bits): 72
    //   Size (bits): 8
    /////////////////////////////////////////////////////////

    /**
     * Return whether the field 'Status' is signed (false).
     */
    public static boolean isSigned_Status() {
        return false;
    }

    /**
     * Return whether the field 'Status' is an array (false).
     */
    public static boolean isArray_Status() {
        return false;
    }

    /**
     * Return the offset (in bytes) of the field 'Status'
     */
    public static int offset_Status() {
        return (72 / 8);
    }

    /**
     * Return the offset (in bits) of the field 'Status'
     */
    public static int offsetBits_Status() {
        return 72;
    }

    /**
     * Return the value (as a short) of the field 'Status'
     */
    public short get_Status() {
        return (short)getUIntBEElement(offsetBits_Status(), 8);
    }

    /**
     * Set the value of the field 'Status'
     */
    public void set_Status(short value) {
        setUIntBEElement(offsetBits_Status(), 8, value);
    }

    /**
     * Return the size, in bytes, of the field 'Status'
     */
    public static int size_Status() {
        return (8 / 8);
    }

    /**
     * Return the size, in bits, of the field 'Status'
     */
    public static int sizeBits_Status() {
        return 8;
    }

}