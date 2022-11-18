const cds = require('@sap/cds')
let NorthWindService = null;
let FlightService = null;

(async function () {
    // Connect to external OData services
    NorthWindService = await cds.connect.to('northwind');
    FlightService = await cds.connect.to('ZRMTSAMPLEFLIGHT');
})();

class BPWrapperService extends cds.ApplicationService { init(){

  
const { MyProduct, CarrierCollection } = this.entities


this.on ('READ', CarrierCollection, async (req) => {
    const tx = FlightService.tx(req);
    return await tx.run(req.query.where({CURRCODE:'USD'}));
})

this.on ('READ', MyProduct, async (req) => {
    const tx = NorthWindService.tx(req);
    return await tx.run(req.query.where({Rating:{'>':3}}));
})

  return super.init()
}}

module.exports = { BPWrapperService }