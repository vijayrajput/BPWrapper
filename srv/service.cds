using { ZRMTSAMPLEFLIGHT } from './external/ZRMTSAMPLEFLIGHT.cds';

using { northwind } from './external/northwind.cds';

using { BPWrapper as my } from '../db/schema';

using BPWrapper from '../db/schema';

@path : 'service/BPWrapper'
service BPWrapperService
{
    entity MyProduct as
        projection on northwind.Products
        {
            ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Rating,
            Price
        };

    entity CarrierCollection as
        projection on ZRMTSAMPLEFLIGHT.CarrierCollection
        {
            *
        }
        excluding
        {
            mimeType,
            blob,
            carrierFlights,
            carrierFlights_FW
        };
}

annotate BPWrapperService with @requires :
[
    'authenticated-user'
];
