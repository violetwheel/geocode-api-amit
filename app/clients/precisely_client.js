import got from 'got';

/**
 * A basic example using got
 * https://www.npmjs.com/package/got
 * @param {*} parameters The post parameters for the API call
 * @returns The data returned from the API call
 */
const RequestExample = async (parameters) => {
  const data = await got.post('https://httpbin.org/anything', {
    json: parameters
  }).json();

  return data;
};

export default RequestExample;