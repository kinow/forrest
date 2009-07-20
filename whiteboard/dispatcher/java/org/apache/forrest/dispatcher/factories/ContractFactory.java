/*
* Licensed to the Apache Software Foundation (ASF) under one or more
* contributor license agreements.  See the NOTICE file distributed with
* this work for additional information regarding copyright ownership.
* The ASF licenses this file to You under the Apache License, Version 2.0
* (the "License"); you may not use this file except in compliance with
* the License.  You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
package org.apache.forrest.dispatcher.factories;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.forrest.dispatcher.api.Contract;
import org.apache.forrest.dispatcher.config.DispatcherBean;
import org.apache.forrest.dispatcher.exception.DispatcherException;
import org.apache.forrest.dispatcher.impl.XSLContract;

public class ContractFactory {

  protected final Log log = LogFactory.getLog(this.getClass()
      .getCanonicalName());

  private DispatcherBean config;

  public ContractFactory(DispatcherBean config) {
    this.config = config;
  }

  private Map<String, Contract> map = null;

  /**
   * Get the register which contains all components.
   * 
   * @return the register which contains all components
   */
  public Map<String, Contract> getMap() {
    if (null == map) {
      map = new HashMap<String, Contract>();
    }
    return map;
  }

  /**
   * Set the register which contains all components.
   * 
   * @param map
   *          the register which contains all components.
   */
  public void setMap(Map<String, Contract> map) {
    this.map = map;
  }

  /**
   * Will lookup which component is linked to the name and will return it.
   * 
   * @param name
   *          -the name of the component you need.
   * @return plugin to process the job.
   * @throws DispatcherException
   */
  public Contract resolve(String name) throws DispatcherException {
    Contract contract = getMap().get(name);
    if (null == contract) {
      /*
       * If the contract is null here that means we do not have a java contract
       * because they are configured via spring and should be in the map at this
       * point in time.
       * 
       * This means we will now try to resolve the contract via a url, which
       * will return a stream. If this stream is null it means that the
       * requested contract does not exist. Otherwise it is a xsl based
       * contract.
       */
      contract = new XSLContract(config.isAllowXmlProperties());
      InputStream xslStream = config.getResolver().resolve(
          config.getContractUriPrefix() + name + config.getContractUriSufix());
      contract.initializeFromStream(xslStream);
      // closing stream
      if (xslStream != null) {
        try {
          xslStream.close();
        } catch (IOException e) {
          log.fatal(e);
        }
      }
    }
    return contract;
  }
}
