package com.hs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member {
	private String memID;
    private String memPassword;
    private String memName;
    private int memAge;
    private String memGender;
    private String memEmail;
    private String memProfile;

}
