package helloworld;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SmsSender{
    // Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID =
            "AC1f402d36871706ea26044373288ab16d";
    public static final String AUTH_TOKEN =
            "2d8048b8d484fb1d555d910f8306ce7a";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message.creator(new PhoneNumber("+919929078141"), // to
                        new PhoneNumber("+12018317373"), // from
                        "Ticket Booked?").create();

       // System.out.println(message.getSid());
    }
}