/* checksum : b42d9007f3121130a6399ffa307844a9 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
service northwind {};

@cds.external : true
@cds.persistence.skip : true
entity northwind.Products {
  key ID : Integer not null;
  @m.FC_TargetPath : 'SyndicationTitle'
  @m.FC_ContentKind : 'text'
  @m.FC_KeepInContent : 'false'
  Name : LargeString null;
  @m.FC_TargetPath : 'SyndicationSummary'
  @m.FC_ContentKind : 'text'
  @m.FC_KeepInContent : 'false'
  Description : LargeString null;
  @odata.Type : 'Edm.DateTime'
  ReleaseDate : DateTime not null;
  @odata.Type : 'Edm.DateTime'
  DiscontinuedDate : DateTime null;
  Rating : Integer not null;
  Price : Decimal not null;
  @cds.ambiguous : 'missing on condition?'
  Category : Association to northwind.Categories {  };
  @cds.ambiguous : 'missing on condition?'
  Supplier : Association to northwind.Suppliers {  };
};

@cds.external : true
@cds.persistence.skip : true
entity northwind.Categories {
  key ID : Integer not null;
  @m.FC_TargetPath : 'SyndicationTitle'
  @m.FC_ContentKind : 'text'
  @m.FC_KeepInContent : 'true'
  Name : LargeString null;
  @cds.ambiguous : 'missing on condition?'
  Products : Association to many northwind.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
entity northwind.Suppliers {
  key ID : Integer not null;
  @m.FC_TargetPath : 'SyndicationTitle'
  @m.FC_ContentKind : 'text'
  @m.FC_KeepInContent : 'true'
  Name : LargeString null;
  Address : northwind.Address not null;
  Concurrency : Integer not null;
  @cds.ambiguous : 'missing on condition?'
  Products : Association to many northwind.Products {  };
};

@cds.external : true
type northwind.Address {
  Street : LargeString null;
  City : LargeString null;
  State : LargeString null;
  ZipCode : LargeString null;
  Country : LargeString null;
};

@cds.external : true
function northwind.GetProductsByRating(
  rating : Integer null
) returns many northwind.Products null;

