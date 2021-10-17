<?php

use craft\elements\Entry;
use craft\helpers\UrlHelper;

return [
	'endpoints' => [
		'api/entries.json' => [
			'elementType' => Entry::class,
			'criteria' => ['section' => 'entries'],
            'transformer' => function(Entry $entry) {
            	$image = $entry->imageData->one();
                return [
                    'title' => $entry->title,
                    'url' => $entry->url,
                    'jsonUrl' => UrlHelper::url("api/entries/{$entry->id}.json"),
                    'redactorContent' => $entry->redactorContent,
                    'imageData' => [
                    	'url' => $image->url,
                    	'filename' => $image->filename,
                    	'title' => $image->title,
                    	'extension' => $image->extension,
                    	'width' => $image->width,
                    	'height' => $image->height,
                    	'mimeType' => $image->mimeType
                    ]
                ];
            },
		],
        'api/entries/<entryId:\d+>.json' => function($entryId) {
            return [
                'elementType' => Entry::class,
                'criteria' => ['id' => $entryId],
                'one' => true,
                'transformer' => function(Entry $entry) {
                	$image = $entry->imageData->one();
                    return [
                        'title' => $entry->title,
                        'url' => $entry->url,
                        'redactorContent' => $entry->redactorContent,
                        'imageData' => [
	                    	'url' => $image->url,
	                    	'filename' => $image->filename,
	                    	'title' => $image->title,
	                    	'extension' => $image->extension,
	                    	'width' => $image->width,
	                    	'height' => $image->height,
	                    	'mimeType' => $image->mimeType
	                    ]
                    ];
                },
            ];
        },
	]
];