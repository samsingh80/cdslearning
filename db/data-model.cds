namespace cdslearning.db;

entity Sales {
  key ID       : Integer;
      region   : String(100);
      country  : String(100);
      org      : String(4);
      amount   : Integer;
      comments : String(100);
};

entity GAHeader {
    key request_id          : String(30);
        kaust_id            : String(15);
        comments            : String;
        gacomments          : String;
};

entity BirthCertificate {
    key request_id      : String(30);
    key sequence_number : Integer;
        first_name      : String(40);
        nationality     : String(40);
 
};

entity address{
 key   GUID_NODE_KEY	: String(32);
    CITY	    : String(32);
    POSTAL_CODE	 : String(32);
    STREET	: String(100);
    BUILDING	: String(100);
    COUNTRY: String(100);
    ADDRESS_TYPE: String(32);
    VAL_START_DATE : Date;	
    VAL_END_DATE : Date;	
    LATITUDE	: Decimal;
    LONGITUDE: Decimal;
    businesspartner: Association to one businesspartner on businesspartner.address = $self;
    
};

entity businesspartner{
   key NODE_KEY : String(32);
    BP_ROLE : String(2);
    EMAIL_ADDRESS: String(64);
    PHONE_NUMBER: String(14);
    FAX_NUMBER: String(14);
    WEB_ADDRESS: String(64);
    BP_ID : String(16);
    COMPANY_NAME: String(60);
    address : Association to  address;
  //  addresses : Association to  address on addresses.NODE_KEY = ADDRESS_GUID_NODE_KEY;
  
};

entity purchaseorder{

  key  ID	     : String(100);
    PO_ID	: String(100);
    PARTNER_GUID_NODE_KEY : String(100);	
    CURRENCY_CODE :	String(4);
    GROSS_AMOUNT  : Decimal;	 
    NET_AMOUNT	  : Decimal;
    TAX_AMOUNT	  : Decimal;
    LIFECYCLE_STATUS : String(1);	
    OVERALL_STATUS   : String(1);
    Items : Association to many poitems on Items.PARENT_KEY = $self;
 
};

entity poitems{
  key  ID	: String(100);
    PARENT_KEY : Association to purchaseorder;	
    PO_ITEM_POS	: Integer;
    GUID_NODE_KEY: String;
    CURRENCY_CODE	: String(4);
    GROSS_AMOUNT : Decimal;	
    NET_AMOUNT	: Decimal;
    TAX_AMOUNT: Decimal;
};

entity product{

    key GUID_NODE_KEY	: UUID;
    PRODUCT_ID	: String(28);
    TYPE_CODE	: String(2);
    CATEGORY	: String(32);
    SUPPLIER_GUID_NODE_KEY : String(32);
    TAX_TARIF_CODE	: Integer;
    MEASURE_UNIT : String(2);	
    WEIGHT_MEASURE : Decimal;	
    WEIGHT_UNIT : String(2);	
    CURRENCY_CODE : String(4);	
    PRICE	: Decimal;
    WIDTH	: Decimal;
    DEPTH	: Decimal;
    HEIGHT	: Decimal;
    DIM_UNIT : String(2);	
    DESCRIPTION: String(200);
};

entity prodtext{

    key NODE_KEY	: UUID;
    PARENT_KEY	     : UUID;
    LANGUAGE	: String(20);
    TEXT       : String;    

};







