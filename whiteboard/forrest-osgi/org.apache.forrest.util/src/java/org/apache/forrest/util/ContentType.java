/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.forrest.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Hashtable;
import java.util.Map;

import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.mime.MediaType;
import org.apache.tika.mime.MimeTypesFactory;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.xml.XMLParser;

public class ContentType {

  private static final Tika sTika = new Tika();
  private static final Map<String, String> sContentTypeMap;

  public static String getExtensionByName(String name) {
    if (null == name || name.length() == 0) {
      throw new IllegalArgumentException("Argument must not be null or empty");
    }

    int pos = name.lastIndexOf(".");

    if (pos > 0 && name.length() > 1) {
      return name.substring(pos + 1);
    }

    return null;
  }

  public static String getContentTypeByName(String path) {
    if (null == path || path.length() == 0) {
      throw new IllegalArgumentException("Argument must not be null or empty");
    }

    return sTika.detect(path);
  }

  public static String getContentTypeByName(File file) {
    if (null == file || file.getName().length() == 0) {
      throw new IllegalArgumentException("Argument must not be null or empty");
    }

    if (!file.canRead()) {
      System.out.println("getContentTypeByName(File) cannot read file: " + file.getName());

      return null;
    }

    String contentType = null;

    try {
      contentType = sTika.detect(file.toURI().toURL());
    } catch (MalformedURLException mue) {
      ;
    } catch (IOException ioe) {
      ;
    }

    return contentType;
  }

  public static String getContentTypeByExt(String ext) {
    return getContentTypeByName("foo." + ext);
  }

  static {
    sContentTypeMap = new Hashtable<String, String>();
    sContentTypeMap.put("xml", "application/xml");
    sContentTypeMap.put("html", "text/html");
    sContentTypeMap.put("txt", "text/plain");
    sContentTypeMap.put("pdf", "application/pdf");
    sContentTypeMap.put("css", "text/css");
    sContentTypeMap.put("js", "application/javascript");
    sContentTypeMap.put("fo", "application/xml+fo"); // FIXME
  }

}
