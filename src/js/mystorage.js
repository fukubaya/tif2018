/*
 * mystorage.js
 */
export default class MyStorage {
  constructor(storage, keyPrefix){
    this.storage = storage;
    this.keyPrefix = keyPrefix;
  }
  setItem(key, value) {
    this.storage.setItem(this.keyPrefix + '-' + key, JSON.stringify(value));
  }
  getItem(key) {
    return JSON.parse(this.storage.getItem(this.keyPrefix + '-' + key));
  }
}
