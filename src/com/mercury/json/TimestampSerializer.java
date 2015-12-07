package com.mercury.json;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

public class TimestampSerializer extends JsonSerializer<Timestamp>{

	@Override
	public void serialize(Timestamp ts, JsonGenerator jg,
			SerializerProvider sp) throws IOException,
			JsonProcessingException {
		// TODO Auto-generated method stub
		SimpleDateFormat tsFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedTs = tsFormat.format(ts);
		jg.writeString(formattedTs);
	}
	
}
