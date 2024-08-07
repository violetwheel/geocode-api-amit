import ForwardGeocode from './app/functions/fwd_geocode.js';
import logger from './app/utils/logger.js';

/**
 * The AWS lambda entry point for the forward handler.
 * This is just a dummy implementation.
 * @param {*} event 
 * @param {*} context 
 * @returns A JSON object with statusCode and body as the payload
 */
export const ForwardHandler = async(event, /*context*/) => {
  logger.info(`Received event ${JSON.stringify(event)}`);

  let response = await ForwardGeocode(event.body); 
  if (response) {
    return {
      statusCode: 200,
      body: JSON.stringify(response)
    }
  }
}
