import RequestExample from '../clients/precisely_client.js';
import logger from '../utils/logger.js';

/**
 * Proxy for RequestExample for mockability
 * @param {*} address TODO 
 * @returns TODO
 */
const MakeAPICall = async (address) => {
  return await RequestExample(address);
};

/**
 * TODO
 * @param {*} address TODO 
 * @returns TODO 
 */
const ForwardGeocode = async (address) => {
  // example
  let response = await MakeAPICall(address);
  logger.info(response);
  return response;
};

export default ForwardGeocode;