�
    @  �         _ 	      !         !�  6     //  0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               �   �  B  �
  �  �   �
  �  )��  �    ��PRIMARY�date�correlationid�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      InnoDB   PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2013082901 VALUES LESS THAN (1377734400) ENGINE = InnoDB,
 PARTITION p2013090821 VALUES LESS THAN (1378670400) ENGINE = InnoDB,
 PARTITION p2013090822 VALUES LESS THAN (1378674000) ENGINE = InnoDB,
 PARTITION p2013090823 VALUES LESS THAN (1378677600) ENGINE = InnoDB,
 PARTITION p2022061400 VALUES LESS THAN (1655251200) ENGINE = InnoDB,
 PARTITION p2022061500 VALUES LESS THAN (1655337600) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      8                                                                                                                                                                                                                                                               � �  �s         P       � )                                          id  date  	micro_ts  correlation_id  
source_ip 	 source_port 
 destination_ip  destination_port  proto  family  type  node  msg    B      
  �     	   C               !  
E�       !  	

 �       
@� �      !  

 �        �        � �      �       Jw�      !  K�      !  �id�date�micro_ts�correlation_id�source_ip�source_port�destination_ip�destination_port�proto�family�type�node�msg� 