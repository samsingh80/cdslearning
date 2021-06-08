using {cdslearning.db as db} from '../db/data-model';

service CatalogService @(path : '/catalog')
{
    entity Sales
      as select * from db.Sales;

    entity BirthCert as projection ON db.BirthCertificate;   

    entity PurchaseOrder as projection on db.purchaseorder;


};