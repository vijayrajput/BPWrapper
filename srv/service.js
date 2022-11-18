const cds = require('@sap/cds')

class BPWrapperService extends cds.ApplicationService { init(){

  
const { MyProduct, CarrierCollection } = this.entities

this.before ('READ', MyProduct, async (req) => {
      req.query = req.query.where({Rating:{'>':3}});
 })

  this.before ('READ', CarrierCollection, async (req) => {
    req.query = req.query.where({CURRCODE:'USD'});
})

  return super.init()
}}

module.exports = { BPWrapperService }