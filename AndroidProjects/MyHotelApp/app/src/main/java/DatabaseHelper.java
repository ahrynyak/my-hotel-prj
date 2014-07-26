import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/**
 * Created by User on 26-Jul-14.
 */
public class DatabaseHelper extends SQLiteOpenHelper {

    // Logcat tag
    private static final String LOG = "DatabaseHelper";

    // Database Version
    private static final int DATABASE_VERSION = 1;

    // Database Name
    private static final String DATABASE_NAME = "MyHotelDB";

    // Table Names
    private static final String TABLE_ROOM = "Room";
    private static final String TABLE_ROOMBOOKING = "RoomBooking";

    // Room Table - column names
    private static final String KEY_ROOM_ID = "RoomID";
    private static final String KEY_ROOM_Name = "Name";
    private static final String KEY_ROOM_Capacity = "Capacity";

    // Table Create Statements
    // Room table create statement
    private static final String CREATE_TABLE_ROOM = "CREATE TABLE " + TABLE_ROOM + "(" +
            KEY_ROOM_ID + " INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL," +
            KEY_ROOM_Name + " TEXT NOT NULL," +
            KEY_ROOM_Capacity + " INTEGER NOT NULL )";


    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // creating required tables
        db.execSQL(CREATE_TABLE_ROOM);
        createRoom("1 DBL",2);
        createRoom("2 DBL",2);
        createRoom("3 Apart",4);
        createRoom("4 DBL+1 (Triple)",2);
        createRoom("5 DBL",2);
        createRoom("6 DBL",4);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // on upgrade drop older tables
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_ROOM);
        // create new tables
        onCreate(db);
    }

    /*
 * Creating a Room
 */
    public void createRoom(String name, int capacity) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(KEY_ROOM_Name, name);
        values.put(KEY_ROOM_Capacity, capacity);
        db.insert(TABLE_ROOM, null, values);
    }
}
