// convert numbers to a human readable format
const n2h = aNumber =>
  String(aNumber)
    .split('')
    .reverse()
    .map((v, i) => i !== 0 && 0 === i % 3 ? `${v}.` : v)
    .reverse()
    .join('');


module.exports = {
  n2h,
};
