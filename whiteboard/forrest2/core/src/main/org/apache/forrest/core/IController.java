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
package org.apache.forrest.core;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.util.List;

import org.apache.forrest.core.document.AbstractOutputDocument;
import org.apache.forrest.core.document.AbstractSourceDocument;
import org.apache.forrest.core.document.InternalDocument;
import org.apache.forrest.core.exception.LocationmapException;
import org.apache.forrest.core.exception.ProcessingException;
import org.apache.forrest.core.locationMap.AbstractSourceNode;
import org.apache.forrest.core.locationMap.LocationNode;
import org.apache.forrest.core.plugin.AbstractInputPlugin;
import org.apache.forrest.core.plugin.BaseOutputPlugin;
import org.apache.forrest.core.reader.IReader;

public interface IController {
	final String sourceURLExtension = ".forrestSource";

	final String internalURLExtension = ".forrestInternal";

	final String pipelineURLExtension = ".forrestPipeline";
	
	public abstract AbstractInputPlugin getInputPlugin(
			final AbstractSourceDocument doc);

	public abstract BaseOutputPlugin getOutputPlugin(final URI requestURI);

	/**
	 * Get a reader that can be used for retrieving a resource
	 * from a given URI. Note that this method will never
	 * return an aggregate reader so it should be used with 
	 * caution. It is much safer to use getReader(sourceNode).
	 * 
	 * @param sourceURI
	 * @return
	 * @throws ProcessingException
	 * @see {@link #getReader(AbstractSourceNode)}
	 */
	public abstract IReader getReader(final URI sourceURI) throws ProcessingException;
	
	/**
	 * Get a reader that can be used for retrieving a resource
	 * from a given source node.
	 * 
	 * @param sourceNode
	 * @return
	 * @throws ProcessingException
	 */
	public abstract IReader getReader(final AbstractSourceNode sourceNode) throws ProcessingException;

	/**
	 * Get the source URLs for a given request URI.
	 * 
	 * @param requestURI
	 * @return
	 * @throws IOException
	 * @throws LocationmapException
	 * @throws ProcessingException
	 */
	public abstract List<LocationNode> getSourceLocations(final URI requestURI)
			throws IOException, LocationmapException, ProcessingException;

	/**
	 * Get the source documents for a given request URI.
	 * 
	 * @param requestURI
	 * @return
	 * @throws ProcessingException
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public abstract AbstractSourceDocument getSourceDocuments(
			final URI requestURI) throws MalformedURLException,
			ProcessingException;

	/**
	 * Get the internal format documents for a given request URI.
	 * 
	 * @param requestURI
	 * @return
	 * @throws ProcessingException
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public abstract InternalDocument getInternalDocument(
			final URI requestURI) throws ProcessingException;

	/**
	 * Get the output format documents for a given request URI.
	 * 
	 * @param requestURI
	 * @return
	 * @throws ProcessingException
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public abstract AbstractOutputDocument getOutputDocument(
			final URI requestURI) throws MalformedURLException,
			ProcessingException;

}