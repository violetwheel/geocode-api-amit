import { expect } from 'chai';
import { describe, it } from 'mocha';
import ForwardGeocode from "../../app/functions/fwd_geocode.js";
import HttpRequestMock from 'http-request-mock';
const mocker = HttpRequestMock.setup();

const gotResponseTemplate = {
  args: {},
  data: "yourdata",
  headers: {},
  json: {},
  method: "POST",
  url: "https://httpbin.org/anything"
};

describe("Module", async function() {
  describe("Function", async function() {
   // test something
    it('can do some operation with these parameters', async function() {
      let gotResponse = {gotResponseTemplate};
      gotResponse.json = {data: 'value'};
      mocker.post('https://httpbin.org/anything', gotResponse);

      let response = await ForwardGeocode("someaddress");
      expect(response.json).to.deep.equal({data: 'value'});
    });

    it('can do some async operation with these parameters', async function() {
      expect(true).to.be.true;
    });
  });
});